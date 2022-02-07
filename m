Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE684AB8FD
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Feb 2022 11:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0123310F7C4;
	Mon,  7 Feb 2022 10:48:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFAB10F7C3;
 Mon,  7 Feb 2022 10:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644230899; x=1675766899;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mVOHb531swiHoNSO2HEJyxs7QHmBeZIo9CLzkP+bSBs=;
 b=ja1FvV8dbIfrmTFe/wVkkFv6aJCVvEmmdDG0XLr1kD3JMCI8Fq6j2wNc
 gDqYGrgiw9i9SzLRkkYaqo7u09tV2JODxZ0dBS64n7LnF7pVYSozmZbi5
 n8wH7xpQp0OLmBF8TJFHwvd5Ifh5nD65GZ7P1Kyjo5/w0KcmWUaj0KrsX
 ITqy70nxx2X/WMLyXa1qZ/l7Z/bSYAhJdq8duKnZcXN+n9dLvVAKuSmx3
 5xLSnmIc2YQm91vbGCqHXpdwDzkmbW+R8k1+o86SRnfcj3xM/Il6O9tf7
 o9PrKEhjl2mtw72BmznaFcLM6V2+ZqT64vau6VFmwncmSe8qvGiowo11Y w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="273209902"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="273209902"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 02:48:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="700420240"
Received: from nbaca1-mobl.ger.corp.intel.com (HELO localhost) ([10.252.18.25])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 02:48:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH 1/3] i915/gvt: Introduce the mmio_table.c to support
 VFIO new mdev API
In-Reply-To: <20220207083535.GA25345@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
 <20220207073247.GA24327@lst.de>
 <DM4PR11MB5549FE45F8098368114ADE75CA2C9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20220207083535.GA25345@lst.de>
Date: Mon, 07 Feb 2022 12:48:08 +0200
Message-ID: <877da7rlzr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Xu, 
 Terrence" <terrence.xu@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 07 Feb 2022, Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Feb 07, 2022 at 08:28:13AM +0000, Wang, Zhi A wrote:
>> 1) About having the mmio_table.h, I would like to keep the stuff in a
>> dedicated header as putting them in intel_gvt.h might needs i915 guys
>> to maintain it.
>> 2) The other one is about if we should move the mmio_table.c into
>> i915 folder. I guess we need the some comments from Jani. In the
>> current version that I am testing, it's still in GVT folder. Guess we
>> can submit a patch to move it to i915 folder later if Jani is ok
>> about that.
>
> Yes, let's have Jani chime in on these.  They're basically one and the
> same issue.  This code will have to be built into into the core i915
> driver even with my planned split, which is kindof the point of this
> exercise.  I think it makes sense to use the subdirectories as boundaries
> for where the code ends up and not to declarare maintainership boundaries,
> but it will be up to the i915 and gvt maintainers to decide that.

Agreed. If there's going to be a gvt.ko, I think all of gvt/ should be
part of that module, nothing more, nothing less.

The gvt related files in i915/ should probably be named intel_gvt* or
something, ditto for function naming, and we'll probably want patches
touching them be Cc'd to intel-gfx list.

Joonas, Rodrigo, Tvrtko, thoughts?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
