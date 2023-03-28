Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B686CB3F2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Mar 2023 04:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177AD10E28C;
	Tue, 28 Mar 2023 02:24:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1111B10E424
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Mar 2023 02:24:16 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 w5-20020a253005000000b00aedd4305ff2so10680897ybw.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 Mar 2023 19:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679970255;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IIWk8E2FhD0ZC/ZMkyMUSyLH1n6qTXVTC28fBAMF0u4=;
 b=eSI0jSMtM8TCN3DIt0ALDF8asOGVoGQPxFSek4Og40V4GHTgb7VX0uVSFnjiDOcbxo
 EQ3YxSPgX5jfI/ZQvGom56MhyFLfgFUBZqwmx8himK0CTXSRg6UdvjMCyTUQWYOaksZE
 fDBQzfJiMuLM4b/9ll9TI9ZUrkGPERrDXmnvtsH1PSk3kAWp4zAb5+s3EDOujPm+XHOz
 ez2ZBUOHwemE68BkBAy+S4R1NRz/YNW2LraknIbs6ZrAcZTGI4Wx7n9kZMcwd2frIrFg
 VTGvQCA4KhdFehoRP7IDJDyjak4oEB5m4es16rsqwoQc4HlhGIVNHMRdkI5K3KsSdbfp
 V6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679970255;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IIWk8E2FhD0ZC/ZMkyMUSyLH1n6qTXVTC28fBAMF0u4=;
 b=EZOfQDySe1UrekvuD0mnp2aBwzZUPSOWQUbFNRH16QImXjLVaHRGQvZoVRHrmjv/gW
 jhdLODlOk2fNZeMoqCSBluY0Zif+hjMeXbOISG0vD3Y+7IHHnxrdR589HH4gKYITKeKX
 COTIia7ZkYiSKWLSLnvIwfsaspPwipdQ3nu+7+5HtzR/BhNW/Z/I7szhjzklfRfChy7S
 ecgOZDCaolI1QAclhyd8qAcStBFf3tsuhoXBuqFHIksIKSYBZyU6PMQnRE600nR6A2gg
 GZYQc5p+nPqRi703eHoHoUXODFsWmbgkTo2vWYgR9jlcGt/Ij7x3kG0j1i2NHWFLarxI
 VEYw==
X-Gm-Message-State: AAQBX9fAn7cvTnlQxmJiUJtc/mY0s1saad8v3c1VdMUGJR5jDvC1WcwX
 EJSrY2OSGMBzyk8FVNDy5rm1Sw7AwBE=
X-Google-Smtp-Source: AKy350Yc9gNnjUwkT1L/Czn4VDNPMMf9w37THZNTzarP3ln1ljYD3oSIACFpDcm6vwQtbisDUVLH1n76PiQ=
X-Received: from pandoh.svl.corp.google.com
 ([2620:15c:2c5:11:7ff3:b6c5:b0f1:63e8])
 (user=pandoh job=sendgmr) by 2002:a05:6902:18c7:b0:b72:fff0:2f7f with SMTP id
 ck7-20020a05690218c700b00b72fff02f7fmr11533578ybb.4.1679970255089; Mon, 27
 Mar 2023 19:24:15 -0700 (PDT)
Date: Mon, 27 Mar 2023 19:23:57 -0700
In-Reply-To: <20230327094047.47215-17-yi.l.liu@intel.com>
Mime-Version: 1.0
References: <20230327094047.47215-17-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230328022357.2268961-1-pandoh@google.com>
Subject: Re: [PATCH v8 16/24] iommufd/device: Add iommufd_access_detach() API
From: Jon Pan-Doh <pandoh@google.com>
To: yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, jasowang@redhat.com, xudong.hao@intel.com,
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, mjrosato@linux.ibm.com, lulu@redhat.com,
 yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com, jgg@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, alex.williamson@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 Jon Pan-Doh <pandoh@google.com>, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2023/3/27 02:40, Yi Liu wrote:
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 2e6e8e217cce..ec2ce3ef187d 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -263,6 +263,8 @@ struct iommufd_access {
>  	struct iommufd_object obj;
>  	struct iommufd_ctx *ictx;
>  	struct iommufd_ioas *ioas;
> +	struct iommufd_ioas *ioas_unpin;
> +	struct mutex ioas_lock;
>  	const struct iommufd_access_ops *ops;
>  	void *data;
>  	unsigned long iova_alignment;

I think you may need to initialize ioas_lock. I got lockdep warnings running
iommufd selftests against this patch. Those went away when I added mutex_init().

---
 drivers/iommu/iommufd/device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index f0522d80919d..0eaae60f3537 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -474,6 +474,7 @@ iommufd_access_create(struct iommufd_ctx *ictx,
 	iommufd_ctx_get(ictx);
 	iommufd_object_finalize(ictx, &access->obj);
 	*id = access->obj.id;
+	mutex_init(&access->ioas_lock);
 	return access;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_access_create, IOMMUFD);
-- 
2.40.0.348.gf938b09366-goog

