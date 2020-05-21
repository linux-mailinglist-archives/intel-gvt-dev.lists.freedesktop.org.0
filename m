Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981321DC3C5
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 May 2020 02:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5482D6E8C7;
	Thu, 21 May 2020 00:38:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAD06E8C7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 May 2020 00:37:59 +0000 (UTC)
IronPort-SDR: 8LqB+iv9N9fVd7QJKWHO+Ot/phaNQl9ZhZ4x4dc9uoeJkG/uXhYGOmX+5WFwAH+uj3CAfbQqBv
 EJPlyrMvAdVA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 17:37:58 -0700
IronPort-SDR: 6BmOhE13lBjMi1s/8YxRMxd05mjHzhy/wf7l7Tvz9WI35U0tXQiYUFkgAbeOXtMsfXQpftnJv2
 af2N4w1jea9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,415,1583222400"; d="scan'208";a="255160264"
Received: from unknown (HELO [10.239.160.120]) ([10.239.160.120])
 by fmsmga008.fm.intel.com with ESMTP; 20 May 2020 17:37:57 -0700
Subject: Re: [PATCH 2/2] drm/i915/gvt: Add GVT suspend/resume routine to i915.
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20200518062852.158709-1-colin.xu@intel.com>
 <20200518062852.158709-3-colin.xu@intel.com>
 <20200518104513.GY18545@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <2302b038-e847-cb63-b4bc-450ca461b4c8@intel.com>
Date: Thu, 21 May 2020 08:37:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518104513.GY18545@zhen-hp.sh.intel.com>
Content-Language: en-US
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Colin.Xu@intel.com
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


On 2020-05-18 18:45, Zhenyu Wang wrote:
> On 2020.05.18 14:28:52 +0800, Colin Xu wrote:
>> Add GVT suspend/resume routine to i915.
>> GVT relies on i915 so suspend ahead of other i915 routine, and resume
>> at last vice versa.
>>
>> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
>> Signed-off-by: Colin Xu <colin.xu@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_drv.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
>> index 34ee12f3f02d..c5d7d58df67e 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.c
>> +++ b/drivers/gpu/drm/i915/i915_drv.c
>> @@ -87,6 +87,10 @@
>>   #include "intel_pm.h"
>>   #include "vlv_suspend.h"
>>   
>> +#if IS_ENABLED(CONFIG_DRM_I915_GVT)
>> +#include "gvt.h"
>> +#endif
>> +
>>   static struct drm_driver driver;
>>   
>>   static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
>> @@ -1177,6 +1181,11 @@ static int i915_drm_suspend(struct drm_device *dev)
>>   
>>   	drm_kms_helper_poll_disable(dev);
>>   
>> +#if IS_ENABLED(CONFIG_DRM_I915_GVT)
>> +	if (dev_priv->gvt)
>> +		intel_gvt_pm_suspend(dev_priv->gvt);
>> +#endif
>> +
>>   	pci_save_state(pdev);
>>   
>>   	intel_display_suspend(dev);
>> @@ -1354,6 +1363,12 @@ static int i915_drm_resume(struct drm_device *dev)
>>   
>>   	intel_power_domains_enable(dev_priv);
>>   
>> +#if IS_ENABLED(CONFIG_DRM_I915_GVT)
>> +	if (dev_priv->gvt) {
> intel_gvt_active()
Almost forgot we have this function can use. Thanks.
>> +		return intel_gvt_pm_resume(dev_priv->gvt);
>> +	}
>> +#endif
>> +
>>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>>
> Just wrap this in intel_gvt.c/.h which is i915 gvt host side caller, then
> i915 code just call intel_gvt_pm_suspend/resume().

It makes the integration more clean.

I'll move the code and update in V2 and include intel-gfx. Thanks.

>>   	return 0;
>> -- 
>> 2.26.2
>>
>> _______________________________________________
>> intel-gvt-dev mailing list
>> intel-gvt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
